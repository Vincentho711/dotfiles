-- import neogen safely
local neogen_setup, neogen = pcall(require, "neogen")
if not neogen_setup then
  return
end

neogen.setup({
  enabled = true,
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  snippet_engine = "luasnip", -- Currently supported "luasnip", "snippy" and "vsnip"
  languages = {
    python = {
      template = {
        annotation_convention = "reST" -- "reST" is the default for Sphinx, other options include "google_docstrings" and "numpydoc"
      }
    },
    c = {
      template = {
        annotation_convention = "doxygen" -- Only "doxygen" is supported at this stage
      }
    },
    cpp = {
      template = {
        annotation_convention = "doxygen" -- Only "doxygen" is supported at this stage
      }
    },
    java = {
      template = {
        annotation_convention = "javadoc" -- Only "javadoc" is supported at this stage
      }
    }
  }


})
