# Quarto Hebrew Template

This repository provides a template for creating Quarto documents that include Hebrew text. It is designed to help users easily set up their documents with the necessary configurations for Hebrew language support.

This is created and tested on Windows 11 (both x64 and ARM), but it should work on other operating systems as well.

## Installation

To make it work, you need to install the following software and packages:

- [Quarto](https://quarto.org/docs/get-started/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Quarto VS Code Extension](https://marketplace.visualstudio.com/items?itemName=quarto.quarto-vscode)
- [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
- [SBL Hebrew font](https://www.sbl-site.org/resources/fonts/)

Alternatively, you can also use RStudio instead of Visual Studio Code:

- [RStudio](https://posit.co/download/rstudio-desktop/)

Be careful when installing the SBL Hebrew font -- right-click the font file and select "Install for all users" to ensure it is available system-wide.

## Usage

Rendering the document is straightforward. Open the `index.qmd` file in your editor and use the render command:

```bash
quarto render main.qmd
```

Alternatively, you can export the document to docx format using:

```bash
quarto render main.qmd --to docx
```

The lua script in the strip-latex.lua file is used to strip out the Hebrew text from the LaTeX output, which is necessary for proper rendering in docx format.

