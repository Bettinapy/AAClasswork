require 'active_support'
require 'active_support/inflector'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'
class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)

    @req = req 
    @res = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response ||= false
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double render" if already_built_response?
    @res.set_header('Location', url) 
    @already_built_response = true
    @res.status = 302
    self.session.store_session(@res)
    @res.finish
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double render" if already_built_response?
    @res['Content-Type'] = content_type 
    @res.write(content) 
    @already_built_response = true
    self.session.store_session(@res)
    @res.finish
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
 
    controller_name = "#{self.class}".underscore
    current_path = File.dirname(__FILE__)
    template_file = File.join(current_path, "..", "views/#{controller_name}/#{template_name.to_s}.html.erb")
    content = File.read(template_file)
    # we need ERB here is because we want to interpolate the erb tags in our html file, so we need to create a 
    # ERB template to interpolate all the erb tags
    content_erb = ERB.new(content).result(binding)
    render_content(content_erb, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

