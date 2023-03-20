# Maid rules file.

Maid.rules do
  
  # Add your own rules here.
  
  # Clean Downloads folder.
  
  rule 'MP3s likely to be music' do
    dir('~/Downloads/*.mp3').each do |path|
      if duration_s(path) > 30.0
        move(path, '~/Music/iTunes/iTunes Media/Automatically Add to iTunes/')
      end
    end
  end

  rule 'Old files downloaded while developing/testing' do
    dir('~/Downloads/*').each do |path|
      if downloaded_from(path).any? {|u| u.match 'http://localhost' || u.match('http://staging.yourcompany.com') } && 1.week.since?(last_accessed(path))
        trash(path)
      end
    end
  end

  rule 'Linux ISOs, etc' do
    dir('~/Downloads/*.iso').each { |p| trash p }
  end

  rule 'Linux applications in Debian packages' do
    dir('~/Downloads/*.deb').each { |p| trash p }
  end

  rule 'Mac OS X applications in disk images' do
    dir('~/Downloads/*.dmg').each { |p| trash p }
  end
  
  rule 'Throw out Torrents' do
    dir('~/Downloads/*.torrent').each { |p| trash p }
  end
  
  rule 'Throw .pdf out' do
    dir('~/Downloads/*.pdf').each do |path|
      move(path, '~/Documents/PDF')
    end
  end
  
  rule 'Move all .psd files to Pictures folder' do
    dir('~/Downloads/*.psd').each do |path|
      move(path, '~/Pictures')
    end
  end
  
  rule 'Move all .png files to Pictures folder' do
    dir('~/Downloads/*.png').each do |path|
      move(path, '~/Pictures')
    end
  end
  
  rule 'Move all .jpeg files to Pictures folder' do
    dir('~/Downloads/*.jpeg').each do |path|
      move(path, '~/Pictures')
    end
  end
  
  rule 'Move all .jpg files to Pictures folder' do
    dir('~/Downloads/*.jpg').each do |path|
      move(path, '~/Pictures')
    end
  end
  
  rule 'Abandoned Mac OS X apps' do
    dir('~/Downloads/*.app').each { |p| trash p }
  end
  
  rule 'Mac OS X applications in zip files' do
    dir('~/Downloads/*.zip').select do |path|
      candidates = zipfile_contents(path)
      candidates.any? { |c| c.match(/\.app$/) }
    end.each { |p| trash p }
  end
  
  # Clean up Documents folder
  # Not fully finished.
  
  rule 'All PDF files in PDF folder' do
    dir('~/Documents/*.pdf').each do |path|
      move(path, '~/Documents/PDF')
    end
  end
  
  rule 'All Pixelmator files in Images folder' do
    dir('~/Documents/*.pxm').each do |path|
      move(path, '~/Documents/Images')
    end
  end
  
  rule 'Dump all .txt files in txt folder' do
    dir('~/Documents/*.txt').each do |path|
      move(path, '~/Documents/Text files/txt')
    end
  end
  
  rule 'Dump all .rtf files in rtf folder' do
    dir('~/Documents/*.rtf').each do |path|
      move(path, '~/Documents/Text files/rtf')
    end
  end
  
  rule 'Dump all markdown files in markdown folder' do
    dir('~/Documents/*.mdown').each do |path|
      move(path, '~/Documents/Text files/markdown')
    end
  end

  rule 'Dump all markdown files in markdown folder (Abreviated)' do
    dir('~/Documents/*.md').each do |path|
      move(path, '~/Documents/Text files/markdown')
    end
  end
  
  rule 'Dump all pages files in pages folder' do
    dir('~/Documents/*.pages').each do |path|
      move(path, '~/Documents/Text files/pages')
    end
  end
  
  rule 'Dump all doc files in doc folder' do
    dir('~/Documents/*.doc').each do |path|
      move(path, '~/Documents/Text files/doc')
    end
  end
  
  rule 'Dump all extended doc files in doc folder' do
    dir('~/Documents/*.docx').each do |path|
      move(path, '~/Documents/Text files/doc')
    end
  end
  
  rule 'Dump all powerpoint files in projects folder' do
    dir('~/Documents/*.pptx').each do |path|
      move(path, '~/Documents/Projects/Powerpoint files')
    end
  end

  # Clean up Desktop
  
  rule 'Misc Screenshots' do
    dir('~/Desktop/Screen shot *').each do |path|
      if 1.week.since?(last_accessed(path))
        move(path, '~/Documents/Misc Screenshots/')
      end
    end
  end
  
  # Empty trash
  
  rule 'Empty trash' do
    empty = `rm -Rf ~/.Trash/*`
    puts empty
  end
  
end
