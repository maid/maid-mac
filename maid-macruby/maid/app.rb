framework 'Foundation'
framework 'AppKit'

application = NSApplication.sharedApplication
application.activateIgnoringOtherApps(true) 
application.activationPolicy = NSApplicationActivationPolicyRegular

copyMaidDir = `cp -R ~/.maid ~/Desktop/maidmac/maid`
renameMaidDir = `mv .maid maid-dir`
puts copyMaidDir + renameMaidDir

def runScript(sender)
  script = `maid`
  NSLog script
end

def rules(sender)
  frame = [100, 100, 500, 500]
  window = NSWindow.alloc.initWithContentRect(frame,styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: NSBackingStoreBuffered, defer: false)
  content_view = NSView.alloc.initWithFrame(frame)  
  window.contentView = content_view
  window.display
  window.orderFrontRegardless
  window.center
end

def log(sender)
  frame = [100, 100, 500, 500]
  window = NSWindow.alloc.initWithContentRect(frame,styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: NSBackingStoreBuffered, defer: false)
  content_view = NSView.alloc.initWithFrame(frame)  
  window.contentView = content_view
  window.display
  window.orderFrontRegardless
  window.center
  
  logFile = File.open('maid-dir/maid.log')
  log = logFile.read
  
  textView = NSTextView.alloc.initWithFrame([0,0,500,500])
  textView.editable = false
  textView.string = log
  window.contentView.addSubview(textView)
end

def setupMenu
  menu = NSMenu.new
  menu.initWithTitle 'MaidterApp'
  
  run = NSMenuItem.new
  run.title = 'Run Maid'
  run.action = 'runScript:'
  run.target = self
  menu.addItem run
  
  menu.addItem NSMenuItem.separatorItem
  
  log = NSMenuItem.new
  log.title = 'Log'
  log.action = 'log:'
  log.target = self
  menu.addItem log
  
  rules = NSMenuItem.new
  rules.title = 'Rules'
  rules.action = 'rules:'
  rules.target = self
  menu.addItem rules
  
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
  status_item.title = 'm'
end

def quit(sender)
  app = NSApplication.sharedApplication
  app.terminate(self)
end

app = NSApplication.sharedApplication
initStatusBar(setupMenu)
app.run
