# README

Render Markdown views in Rails, with ERB interpolation after the Markdown is rendered (to allow ERB code blocks to be properly escaped).

- A handler for `.md` views, relying on Kramdown to do the markdown conversion
- A custom Kramdown parser to leave ERB tags alone (inline or as blocks, work still needs doing for when they're inside HTML)
- A custom Kramdown renderer that allows for rendering the output of ERB code blocks using a ViewComponent
