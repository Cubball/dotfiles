function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "neovim\keymap\ukrainian-jcuken-improved.vim"
}

function GetTarget($dotfilesDirectory) {
    return "C:\Program Files\Neovim\share\nvim\runtime\keymap\ukrainian-jcuken-improved.vim"
}
