module RSpec
  shared_examples 'a chef sugar' do
    it 'acts as a singleton' do
      described_class.module_eval("def foo; 'result'; end")
      klass = Class.new.tap { |k| k.send(:include, described_class) }
      expect(described_class.foo).to eq(klass.new.foo)
    end

    described_class.instance_methods.each do |name|
      it "defines a `#{name}` DSL method" do
        expect(Chef::Sugar::DSL).to satisfy do |dsl|
          klass_name = described_class.name.downcase.split('::').last

          dsl.method_defined?(name) ||
            dsl.method_defined?("#{klass_name}_#{name}")
        end
      end
    end
  end
end
