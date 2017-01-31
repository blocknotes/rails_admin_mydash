RailsAdmin::Config::Actions::Dashboard.class_eval do
  RailsAdmin::Config::Actions.register(self)

  register_instance_option :root? do
    true
  end

  register_instance_option :breadcrumb_parent do
    nil
  end

  register_instance_option :controller do
    proc do
      @history = @auditing_adapter && @auditing_adapter.latest || []
      @count = {}
      @last_rows = {}
      @abstract_models = RailsAdmin::Config.visible_models(controller: self).collect(&:abstract_model)
      @abstract_models.each do |t|
        scope = @authorization_adapter && @authorization_adapter.query(:index, t)
        @count[t.model.name] = t.count({}, scope)
        @last_rows[t.model.name] = t.all({ limit: 3, sort: t.model.primary_key, sort_reverse: false }, scope)
      end
      @admin_notices = @action.admin_notices.constantize.where( published: true ).order( id: :desc ).limit( 10 ) if @action.admin_notices
      render @action.template_name, status: @status_code || :ok
    end
  end

  register_instance_option :route_fragment do
    ''
  end

  register_instance_option :link_icon do
    'icon-home'
  end

  register_instance_option :statistics? do
    true
  end

  register_instance_option :admin_notices do
    false
  end
end
