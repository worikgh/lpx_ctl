Example setups for `lpx_ctl`

The programme `make_cfg` takes a textual input like [`examples/colour_demo_layout.txt`](colour_demo_layout.txt) and transforms it into a JSON file like [`exaples/colour_demo_layout.json`](colour_demo_layout.json)

`lpx_colour_demo.pl`  outputs (on STDOUT) a text data that can be used by `make_cfg` to create a JSON file to configure `lpx_ctl`

Workflow: `./lpx_colour_demo.pl > colours.txt ; ../make_cfg colours.txt > colours.json ; cd ..; cargo run --release -- examples/colours.json`

It will create two MIDI clients, each with one port: `LpxCtlNote`  which outputs the MIDI signals that can be passed to a synthesiser (I use Yoshimi by preference)

## Directories

### `drumkits`
* Copied from Hydrogen drum machine: https://github.com/hydrogen-music/hydrogen.git

### `sampler`

A link to a MIDI sample player  than can act as a target for the LPX [from here](https://github.com/worikgh/midi_sample)
