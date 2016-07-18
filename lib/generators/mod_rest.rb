class ModRestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_uploader_file
    template "mod_rest.rb", File.join('config/initializers', class_path, 'mod_rest.rb')
  end
end
