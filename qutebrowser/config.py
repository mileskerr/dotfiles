import subprocess
config.load_autoconfig()

c.tabs.position = 'top'
c.statusbar.position = 'bottom'
c.search.ignore_case = 'always'
c.colors.webpage.preferred_color_scheme = 'dark'

#c.content.cookies.accept = 'no-3rdparty'
c.content.cookies.accept = 'never'
c.content.javascript.enabled = False

#use tCh to permenantly enable cookies per domain
#use tSh to permenantly enable javascript per domain
#or these:
config.bind('<Alt-j>', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;;reload')
config.bind('<Alt-c>', 'config-cycle -p -u *://{url:host}/* content.cookies.accept no-3rdparty never;; reload')

config.bind('<m>', 'quickmark-save')
config.bind('O', 'set-cmd-text -s :open -t')
config.bind('Y', "spawn mpv -fs {url} ;;process ;;later 2s back")
config.bind('yf', "hint links spawn mpv -fs {hint-url}")

#config.set('content.user_stylesheets', '~/.config/discordrecolor/discordrecolor.css', '*://discord.com/*')


#colors:

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

dark = xresources['*.background']
light = xresources['*.foreground']


black = xresources['*.warn_bg']
red = xresources['*.color1']
green = xresources['*.color2']
yellow = xresources['*.color3']
navy = xresources['*.color4']
purple = xresources['*.color5']
aqua = xresources['*.color6']
sel_fg = xresources['*.sel_fg']
sel_bg = xresources['*.sel_bg']
warn_bg = xresources['*.warn_bg']









## Background color of the completion widget category headers.
## Type: QssColor
#c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)'
c.colors.completion.category.bg = sel_bg

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = dark

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = dark

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = light

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = dark

## Text color of the completion widget. May be a single color to use for
## all columns or a list of three colors, one for each column.
## Type: List of QtColor, or QtColor
c.colors.completion.fg = light

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = sel_bg

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = dark

## Top border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.top = dark

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = dark

## Foreground color of the matched text in the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.match.fg = light

## Foreground color of the matched text in the completion.
## Type: QtColor
c.colors.completion.match.fg = sel_bg

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = black

## Color of the scrollbar in the completion view.
## Type: QssColor
c.colors.completion.scrollbar.bg = '#333333'

## Color of the scrollbar handle in the completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = navy

## Background color of disabled items in the context menu. If set to
## null, the Qt default is used.
## Type: QssColor
c.colors.contextmenu.disabled.bg = None

## Foreground color of disabled items in the context menu. If set to
## null, the Qt default is used.
## Type: QssColor
c.colors.contextmenu.disabled.fg = None

## Background color of the context menu. If set to null, the Qt default
## is used.
## Type: QssColor
c.colors.contextmenu.menu.bg = None

## Foreground color of the context menu. If set to null, the Qt default
## is used.
## Type: QssColor
c.colors.contextmenu.menu.fg = None

## Background color of the context menu's selected item. If set to null,
## the Qt default is used.
## Type: QssColor
c.colors.contextmenu.selected.bg = None

## Foreground color of the context menu's selected item. If set to null,
## the Qt default is used.
## Type: QssColor
c.colors.contextmenu.selected.fg = None

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = black

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = red

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = light

## Color gradient start for download backgrounds.
## Type: QtColor
c.colors.downloads.start.bg = navy

## Color gradient start for download text.
## Type: QtColor
c.colors.downloads.start.fg = dark

## Color gradient stop for download backgrounds.
## Type: QtColor
c.colors.downloads.stop.bg = green

## Color gradient end for download text.
## Type: QtColor
c.colors.downloads.stop.fg = dark

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'rgb'

## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.fg = 'rgb'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
#c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.8), stop:1 rgba(255, 197, 66, 0.8))'
#c.colors.hints.bg = dark
c.colors.hints.bg = 'rgba(0, 0, 0, 0.6)'

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = light

## Font color for the matched part of hints.
## Type: QtColor
c.colors.hints.match.fg = sel_bg

## Background color of the keyhint widget.
## Type: QssColor
c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = light

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = light

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = dark

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = red

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = light

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = dark

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = '#333333'

## Foreground color of an info message.
## Type: QssColor
c.colors.messages.info.fg = light

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = dark

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = red

## Foreground color of a warning message.
## Type: QssColor
c.colors.messages.warning.fg = light

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = '#444444'

## Border used around UI elements in prompts.
## Type: String
c.colors.prompts.border = '1px solid gray'

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = light

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = 'grey'

## Foreground color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.fg = light

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = purple

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = light

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = '#a12dff'

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = light

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = dark

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = light

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = purple

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = dark

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = navy

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = light

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = dark

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = light

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = navy

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = light

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = purple

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = light

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = navy

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = yellow

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = light

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = aqua

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = light

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = light

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = yellow

## Background color of the tab bar.
## Type: QssColor
c.colors.tabs.bar.bg = warn_bg

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = warn_bg

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = light

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = black

## Color gradient start for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.start = sel_bg

## Color gradient end for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.stop = black

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'rgb'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = warn_bg

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = light

## Background color of pinned unselected even tabs.
## Type: QtColor
c.colors.tabs.pinned.even.bg = navy

## Foreground color of pinned unselected even tabs.
## Type: QtColor
c.colors.tabs.pinned.even.fg = light

## Background color of pinned unselected odd tabs.
## Type: QtColor
c.colors.tabs.pinned.odd.bg = navy

## Foreground color of pinned unselected odd tabs.
## Type: QtColor
c.colors.tabs.pinned.odd.fg = light

## Background color of pinned selected even tabs.
## Type: QtColor
c.colors.tabs.pinned.selected.even.bg = sel_bg

## Foreground color of pinned selected even tabs.
## Type: QtColor
c.colors.tabs.pinned.selected.even.fg = light

## Background color of pinned selected odd tabs.
## Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = sel_bg

## Foreground color of pinned selected odd tabs.
## Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = light

## Background color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.bg = dark

## Foreground color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.fg = light

## Background color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.bg = dark

## Foreground color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.fg = light

## Background color for webpages if unset (or empty to use the theme's
## color).
## Type: QtColor
c.colors.webpage.bg = 'white'






