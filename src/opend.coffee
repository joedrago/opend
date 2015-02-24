# -----------------------------------------------------------------------------
# Includes

gui = window.require('nw.gui')

# -----------------------------------------------------------------------------
# Settings
appName = 'OpenD'
debugMode = true

# -----------------------------------------------------------------------------
# Create main menu

mainMenu = new gui.Menu({ 'type': 'menubar' })
if process.platform == 'darwin'
  mainMenu.createMacBuiltin(appName, {
    hideEdit: true
    hideWindow: true
  })

fileMenu = new gui.Menu()
fileMenu.append new gui.MenuItem {
  label: 'Wat'
  click: ->
    console.log "WAT"
}
mainMenu.append new gui.MenuItem { label: 'File', submenu: fileMenu }

if debugMode
  debugItem = new gui.MenuItem({ label: 'Debug' })
  debugMenu = new gui.Menu()
  debugItem.submenu = debugMenu
  mainMenu.append(debugItem)
  menuItem = new gui.MenuItem({ label: "Open Debugger" })
  debugMenu.append(menuItem)
  menuItem.click = ->
    gui.Window.get().showDevTools()

gui.Window.get().menu = mainMenu

# -----------------------------------------------------------------------------
# derpy stuff

$("#search").on 'input', (ev) ->
  console.log "yep", $("#search").val()
$("#search").focus()

