os = require('os')
gui = window.require('nw.gui')

menu = new gui.Menu({ 'type': 'menubar' })
menu.append(new gui.MenuItem({ label: 'Item A' }))
menu.append(new gui.MenuItem({ label: 'Item B' }))
menu.append(new gui.MenuItem({ type: 'separator' }))
menu.append(new gui.MenuItem({ label: 'Item C' }))

win = gui.Window.get()
if os.platform() == 'darwin'
  menu.createMacBuiltin("OpenD")
win.menu = menu

$("#search").on 'input', (ev) ->
  console.log "yep", $("#search").val()

$("#search").focus()
