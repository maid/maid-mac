framework 'Cocoa'
framework 'AppKit'

def runScript(sender)
  script = `maid -r`
  puts script
end

def manageRules(sender)
  # Open RulesManager.rb
end

def setupMenu
  menu = NSMenu.new
  menu.initWithTitle 'MaidApp'
  
  run = NSMenuItem.new
  run.title = 'Run Maid'
  run.action = 'runScript:'
  run.target = self
  menu.addItem run
  
  menu.addItem NSMenuItem.separatorItem
  
  manageRules = NSMenuItem.new
  manageRules.title = 'Manage Rules'
  manageRules.action = 'manageRules:'
  manageRules.target = self
  menu.addItem manageRules
  
  log = NSMenuItem.new
  log.title = 'Log'
  log.action = 'log:'
  log.target = self
  menu.addItem log
  
  menu.addItem NSMenuItem.separatorItem
  
  quit = NSMenuItem.new
  quit.title = 'Quit'
  quit.action = 'quit:'
  quit.target = self
  menu.addItem quit
end

def initStatusBar(menu)
  status_bar = NSStatusBar.systemStatusBar
  status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
  status_item.setMenu menu 
  status_item.setHighlightMode(true)
  status_item.title = 'maid'
end

def quit(sender)
  app = NSApplication.sharedApplication
  app.terminate(self)
end

app = NSApplication.sharedApplication
initStatusBar(setupMenu)
app.run
