RedmineApp::Application.routes.draw do
#Rails::application::routes.draw do |map|
  match 'projects/:id/issues/get_exposition_level' => 'issues#get_exposition_level'
end
