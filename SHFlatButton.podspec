Pod::Spec.new do |s|
  s.name         	= "SHFlatButton"
  s.version      	= "0.0.1"
  s.summary      	= "`SHFlatButton` a reusable UIButton subclass to create flat buttons"

  s.description  	= <<-DESC
                   `SHFlatButton` a reusable UIButton subclass to create 3d styled flat buttons with shadow
                   DESC

  s.homepage     	= "https://github.com/grevolution/SHFlatButton"
  s.license      	= {:type => 'MIT'}
  s.author       	= { "Shan Ul Haq" => "g@grevolution.me" }

  s.platform     	= :ios
  s.source       	= { :git => "https://github.com/grevolution/SHFlatButton.git", :tag => "0.0.1" }

  s.requires_arc	= true
  s.source_files  	= 'SHFlatButton/SHFlatButton/*.{h,m}'
  s.exclude_files 	= 'Classes/Exclude'

end
