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

viewMenu = new gui.Menu()
viewMenu.append new gui.MenuItem {
  label: 'Wat'
  click: ->
    console.log "WAT"
}
mainMenu.append new gui.MenuItem { label: 'View', submenu: viewMenu }

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
# Keyboard shortcuts

window.Mousetrap.bind 'escape', ->
  console.log 'HIDE'
  gui.Window.get().hide()

gui.App.registerGlobalHotKey new gui.Shortcut({
  key: "Ctrl+Shift+O"
  active: ->
    console.log("Global desktop keyboard shortcut: " + this.key + " active.");
    gui.Window.get().show()
  failed: (msg) ->
    console.log(msg);
})

# -----------------------------------------------------------------------------
# derpy stuff

$("#search").on 'input', (ev) ->
  console.log "yep", $("#search").val()

$("#search").focus()
