[SfTransit::Route, SfTransit::Leg, SfTransit::Stop].each do |model|
  model.class_eval do
    def as_json options = {}
      super(options.merge(:except => [:created_at, :updated_at, :transfer_id]))
    end
  end
end
