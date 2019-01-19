require_relative '../lib/controller'

describe "Controller", :controller do
  let(:race) { Race.new }

  it "should be initialized with a `Race` instance" do
    controller = Controller.new(race)
    expect(controller).to be_a(Controller)
  end
end
