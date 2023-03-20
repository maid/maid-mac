class Core
  def interperters 
    def actions
      rule = "rule 'user_input' do 'user_input' end"
      dir_each = 'dir(file_path).each do'
      dir_single = 'dir(file_path)'
      move = "do |path| move(path, 'file_path') end"
      move_trash = '{ |p| trash p }'
      each = '.each'
      delete = 'rm'
      kind = '*.filetype'
      smart_move = ''
      empty_trash = 'rm -Rf ~/.Trash/*'
    end
    
    def default_file_types
      .pages = '.pages'
      .doc = '.doc, .docx'
      .pdf = '.pdf'
    end
  end
end