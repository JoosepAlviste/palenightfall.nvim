[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
] @text.note

(inline_link
  [
    "["
    "]"
    "("
    ")"
  ] @punctuation.bracket)

(image
  [
    "["
    "]"
    "!"
  ] @punctuation.bracket)

[
  (image_description)
  (link_text)
] @text.title
