require 'rails_helper'

RSpec.describe WelcomeController, type: :request do
  CRONUTS_DEFAULT_URL = 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_'\
                         'Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'.freeze
  DONUTS_DEFAULT_URL  = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/'\
                        '250px-Glazed-Donut.jpg'.freeze

  describe '#index' do
    context 'when index is called' do
      it 'should be successful' do
        get '/welcome/index'
        expect(response).to be_successful
      end

      it 'expects page to contain widget text' do
        get '/welcome/index'
        expect(response.body).to include widget_text
      end
    end

    context 'when index is called with a cronut url param' do
      it 'should change cronut url' do
        cronuts_url_param = 'https://google.com'
        get '/welcome/index', params: { cronuts_url: cronuts_url_param }
        expect(response.body).to include widget_text(cronuts_url: cronuts_url_param)
      end
    end

    context 'when index is called with a donut url param' do
      it 'should change donut url' do
        donut_url_param = 'https://google.com'
        get '/welcome/index', params: { donuts_url: donut_url_param }
        expect(response.body).to include widget_text(donut_url: donut_url_param)
      end
    end

    context 'when index is called with both cronut and donut url params' do
      it 'should change both donut and cronut urls' do
        donut_url_param = 'https://google.com'
        cronuts_url_param = 'https://google1.com'
        get '/welcome/index', params: { donuts_url: donut_url_param, cronuts_url: cronuts_url_param }
        expect(response.body).to include widget_text(cronuts_url: cronuts_url_param, donut_url: donut_url_param)
      end
    end
  end

  private

  def widget_text(donut_url: DONUTS_DEFAULT_URL, cronuts_url: CRONUTS_DEFAULT_URL)
    I18n.t('welcome.index.super_terms_html', cronuts_link: cronuts_url, donuts_link: donut_url)
  end
end
