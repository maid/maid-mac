class MainController
     
     def runScript(sender)
       script = `maid -r`
       puts script
     end
     
     def manageRules(sender)
     end
     
     def log(sender)
     end
     
     def quit(sender)
     end
        
    def statusBar
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
              
      status_bar = NSStatusBar.systemStatusBar
      status_bar.title = 'Maid'
      status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
      status_item.setHighlightMode(true)
      status_item.setMenu(menu)
      
      app_icon = NSImage.imageNamed('app.tiff')
      status_item.setImage(@app_icon)
    end
end