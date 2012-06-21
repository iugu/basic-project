module ActiveRecord
  module Aggregations
    module ClassMethods
      private
        def reader_method(name, class_name, mapping, allow_nil, constructor)
          define_method(name) do
            if @aggregation_cache[name].nil? && (!allow_nil || mapping.any? {|pair| !self.send(pair.first).nil? })
              attrs = mapping.collect {|pair| self.send(pair.first)}
              object = constructor.respond_to?(:call) ?
                constructor.call(*attrs) :
                class_name.constantize.send(constructor, *attrs)
              @aggregation_cache[name] = object
            end
            @aggregation_cache[name]
          end
        end
    end
  end
end
