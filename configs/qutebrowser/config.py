config.load_autoconfig(False)

# palette
bg = "#181818"
bg_dark = "#080808"
surface = "#282828"
surface2 = "#383838"
border = "#484848"
muted = "#585858"
subtle = "#686868"
dim = "#909090"
fg = "#e0e0e0"
accent = "#c8945a"
red = "#8c5a50"

# fonts
font_base = "13px JetBrainsMono Nerd Font"

c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.default_size = "13px"
c.fonts.completion.entry = font_base
c.fonts.completion.category = font_base
c.fonts.statusbar = font_base
c.fonts.downloads = font_base
c.fonts.hints = font_base
c.fonts.messages.error = font_base
c.fonts.messages.info = font_base
c.fonts.messages.warning = font_base
c.fonts.prompts = font_base
c.fonts.tabs.selected = font_base
c.fonts.tabs.unselected = font_base

# completion
c.colors.completion.fg = fg
c.colors.completion.odd.bg = bg_dark
c.colors.completion.even.bg = bg
c.colors.completion.category.fg = accent
c.colors.completion.category.bg = bg_dark
c.colors.completion.category.border.top = bg_dark
c.colors.completion.category.border.bottom = surface
c.colors.completion.item.selected.fg = bg
c.colors.completion.item.selected.bg = accent
c.colors.completion.item.selected.border.top = accent
c.colors.completion.item.selected.border.bottom = accent
c.colors.completion.match.fg = dim
c.colors.completion.scrollbar.fg = muted
c.colors.completion.scrollbar.bg = bg_dark

# downloads
c.colors.downloads.bar.bg = bg_dark
c.colors.downloads.start.fg = bg
c.colors.downloads.start.bg = border
c.colors.downloads.stop.fg = bg
c.colors.downloads.stop.bg = accent
c.colors.downloads.error.fg = red
c.colors.downloads.error.bg = bg_dark

# hints
c.colors.hints.fg = bg
c.colors.hints.bg = accent
c.colors.hints.match.fg = fg
c.hints.border = "1px solid " + border

# keyhint
c.colors.keyhint.fg = fg
c.colors.keyhint.suffix.fg = accent
c.colors.keyhint.bg = bg_dark

# messages
c.colors.messages.error.fg = bg
c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.warning.fg = bg
c.colors.messages.warning.bg = accent
c.colors.messages.warning.border = accent
c.colors.messages.info.fg = fg
c.colors.messages.info.bg = bg_dark
c.colors.messages.info.border = surface

# prompts
c.colors.prompts.fg = fg
c.colors.prompts.bg = bg_dark
c.colors.prompts.border = "1px solid " + border
c.colors.prompts.selected.fg = bg
c.colors.prompts.selected.bg = accent

# statusbar
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.normal.bg = bg_dark
c.colors.statusbar.insert.fg = bg
c.colors.statusbar.insert.bg = accent
c.colors.statusbar.passthrough.fg = bg
c.colors.statusbar.passthrough.bg = border
c.colors.statusbar.command.fg = fg
c.colors.statusbar.command.bg = bg_dark
c.colors.statusbar.command.private.fg = fg
c.colors.statusbar.command.private.bg = surface
c.colors.statusbar.private.fg = fg
c.colors.statusbar.private.bg = surface
c.colors.statusbar.caret.fg = bg
c.colors.statusbar.caret.bg = muted
c.colors.statusbar.caret.selection.fg = bg
c.colors.statusbar.caret.selection.bg = border
c.colors.statusbar.progress.bg = accent
c.colors.statusbar.url.fg = fg
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.hover.fg = dim
c.colors.statusbar.url.success.http.fg = subtle
c.colors.statusbar.url.success.https.fg = dim
c.colors.statusbar.url.warn.fg = accent

# tabs
c.colors.tabs.bar.bg = bg_dark
c.colors.tabs.indicator.start = border
c.colors.tabs.indicator.stop = accent
c.colors.tabs.indicator.error = red
c.colors.tabs.odd.fg = muted
c.colors.tabs.odd.bg = bg_dark
c.colors.tabs.even.fg = muted
c.colors.tabs.even.bg = bg
c.colors.tabs.selected.odd.fg = fg
c.colors.tabs.selected.odd.bg = surface
c.colors.tabs.selected.even.fg = fg
c.colors.tabs.selected.even.bg = surface
c.colors.tabs.pinned.odd.fg = muted
c.colors.tabs.pinned.odd.bg = bg_dark
c.colors.tabs.pinned.even.fg = muted
c.colors.tabs.pinned.even.bg = bg
c.colors.tabs.pinned.selected.odd.fg = fg
c.colors.tabs.pinned.selected.odd.bg = surface
c.colors.tabs.pinned.selected.even.fg = fg
c.colors.tabs.pinned.selected.even.bg = surface

# webpage
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.bg = bg

# search engines
c.url.searchengines = {
    'DEFAULT': 'https://search.brave.com/search?q={}',
    'g': 'https://www.google.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'gh': 'https://github.com/search?q={}',
}

# home page
c.url.start_pages = ['http://search.brave.com']
c.url.default_page = 'http://search.brave.com/'
