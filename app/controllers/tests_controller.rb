class TestsController < Simpler::Controller

  def index
    @tests = Test.all
    status 201
    headers['Content-Language'] = 'ru'
  end

  def create; end

  def show
    @test = Test.find(id: params[:id])
    render inline: "<%= Time.now %>"
  end

end
