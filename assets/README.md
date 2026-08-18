# Icon assets

Source of truth is `icon.svg`. The PNGs are rendered from the same geometry -
regenerate rather than editing them by hand.

- **Design:** a gear in the top right, overlapping horizontal lines in the top
  left (a config tool editing code), with `ST` beneath.
- **Colors:** background `#122A42`, lines/text `#E8EEF5`, gear `#4FB0E8`.
- A background-colored disc sits under the gear so it reads as *on top of* the
  lines. It must be a plain circle: a gear-shaped halo lets the code line show
  through the tooth valleys as white arcs.

`icon-256.png` is the one to upload for the JMP Marketplace listing. The
smaller sizes exist for menu/toolbar use; nothing wires them into
`addin.jmpcust` yet - every command still declares `<jm:icon type="none">`.
