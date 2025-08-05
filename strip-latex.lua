-- Replace \heb{...} inline with inner text for Word
function RawInline(el)
  if FORMAT:match("docx") and el.format == "tex" then
    local content = el.text:match("\\heb%s*{(.-)}")
    if content then
      return pandoc.Str(content)
    end
  end
end

-- Convert \begin{hebrew}...\end{hebrew} to RTL plain paragraphs in docx
function RawBlock(el)
  if FORMAT:match("docx") and el.format == "tex" then
    local text = el.text:gsub("\r\n", "\n") -- Normalize line endings
    local start_pat = "\\begin%s*{hebrew}"
    local end_pat = "\\end%s*{hebrew}"

    if text:match(start_pat) and text:match(end_pat) then
      local content = text
          :gsub(start_pat, "")
          :gsub(end_pat, "")
          :gsub("^%s*", "")
          :gsub("%s*$", "")

      local blocks = {}
      for para in content:gmatch("([^\n]+)") do
        if para:match("%S") then
          -- Use styled paragraph for Word with RTL
          table.insert(blocks, pandoc.Para({
            pandoc.RawInline("openxml", '<w:pPr><w:bidi/></w:pPr>'),
            pandoc.Str(para)
          }))
        end
      end
      return blocks
    end
  end
end
