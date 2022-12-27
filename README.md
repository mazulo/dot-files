In order for some of the `nvim` features to work, we need to install a few libs:

- `ripgrep`
- `rust`
- `lua-language-server`

```bash
cargo install stylua
npm install -g typescript typescript-language-server
python -m pip install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

