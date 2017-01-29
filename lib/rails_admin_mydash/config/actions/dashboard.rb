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
      # @history = @auditing_adapter && @auditing_adapter.latest || []
      @count = {}
      @last_rows = {}
      @abstract_models = RailsAdmin::Config.visible_models(controller: self).collect(&:abstract_model)
      @abstract_models.each do |t|
        scope = @authorization_adapter && @authorization_adapter.query(:index, t)
        @count[t.model.name] = t.count({}, scope)
        @last_rows[t.model.name] = t.all({ limit: 3, sort: t.model.primary_key, sort_reverse: false }, scope)
      end
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

  ## Static
  # class << self
  # end
end

## Original action:
#
# module RailsAdmin
#   module Config
#     module Actions
#       class Dashboard < RailsAdmin::Config::Actions::Base
#         RailsAdmin::Config::Actions.register(self)

#         register_instance_option :root? do
#           true
#         end

#         register_instance_option :breadcrumb_parent do
#           nil
#         end

#         register_instance_option :controller do
#           proc do
#             puts ">>>>>>>>>>>>>>>>>>>>>"
#             @history = @auditing_adapter && @auditing_adapter.latest || []
#             if @action.statistics?
#               @abstract_models = RailsAdmin::Config.visible_models(controller: self).collect(&:abstract_model)

#               @most_recent_created = {}
#               @count = {}
#               @max = 0
#               @abstract_models.each do |t|
#                 scope = @authorization_adapter && @authorization_adapter.query(:index, t)
#                 current_count = t.count({}, scope)
#                 @max = current_count > @max ? current_count : @max
#                 @count[t.model.name] = current_count
#                 next unless t.properties.detect { |c| c.name == :created_at }
#                 @most_recent_created[t.model.name] = t.model.last.try(:created_at)
#               end
#             end
#             render @action.template_name, status: @status_code || :ok
#           end
#         end

#         register_instance_option :route_fragment do
#           ''
#         end

#         register_instance_option :link_icon do
#           'icon-home'
#         end

#         register_instance_option :statistics? do
#           true
#         end
#       end
#     end
#   end
# end
