require 'rails_helper'

RSpec.describe WelcomeController, type: :request do
  CRONUTS_URL = 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_'\
                'Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'.freeze
  DONUTS_URL  = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut'\
                '.jpg'.freeze

  describe '#index' do
    context 'when index is called' do
      it 'should be successful' do
        get '/welcome/index'
        expect(response).to be_successful
      end

      it 'expects page to contain widget text' do
        widget_text = "By selecting this checkbox, you agree that <a href=\"#{CRONUTS_URL}\" target=\"_blank\">"\
                      "cronuts</a> are better than <a href=\"#{DONUTS_URL}\" target=\"_blank\">donuts</a>"
        get '/welcome/index'
        expect(response.body).to include(widget_text)
      end
    end

    context 'when index is called with a cronut url param' do
      it 'should change cronut url' do
        cronuts_url_param = 'https://google.com'
        widget_text = "By selecting this checkbox, you agree that <a href=\"#{cronuts_url_param}\" target=\"_blank\">"\
                      "cronuts</a> are better than <a href=\"#{DONUTS_URL}\" target=\"_blank\">donuts</a>"
        get '/welcome/index', params: { cronuts_url: cronuts_url_param }
        expect(response.body).to include(widget_text)
      end
    end

    context 'when index is called with a donut url param' do
      it 'should change donut url' do
        donut_url_param = 'https://google.com'
        widget_text = "By selecting this checkbox, you agree that <a href=\"#{CRONUTS_URL}\" target=\"_blank\">"\
                      "cronuts</a> are better than <a href=\"#{donut_url_param}\" target=\"_blank\">donuts</a>"
        get '/welcome/index', params: { donuts_url: donut_url_param }
        expect(response.body).to include(widget_text)
      end
    end

  end
end
