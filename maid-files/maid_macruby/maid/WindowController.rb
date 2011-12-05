#
#  WindowController.rb
#  maid
#
#  Created by Yashwant Chauhan on 11/30/11.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class WindowController < NSWindowController
    attr_accessor :run_button
    attr_accessor :log_text
    
    def run_action(sender)
        
        # Run maid script.
        shell = `maid; exit;`;
        puts shell;
        
        # Show log file status for maid.
        file = File.open("/Users/Yashwant/.maid/maid.log");
        contents_file = file.read;
        self.log_text.stringValue = contents_file;
        
    end
end


