require 'rails_helper'

RSpec.describe Widget do
  CRONUTS_URL = 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_'\
  'Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'.freeze
  DONUTS_URL  = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut'\
  '.jpg'.freeze

  describe '.initialize' do
    context 'when no urls are provided' do
      subject { Widget.new }
      it 'should contain default cronuts url if not provided' do
        expect(subject.cronuts_url).to eq(CRONUTS_URL)
      end

      it 'should contain default donuts url if not provided' do
        expect(subject.donuts_url).to eq(DONUTS_URL)
      end
    end

    context 'when urls are provided' do
      subject { Widget.new('http://google.com', 'http://google1.com') }
      it 'should contain provided cronuts url' do
        expect(subject.cronuts_url).to eq('http://google1.com')
      end

      it 'should contain provided donuts url' do
        expect(subject.donuts_url).to eq('http://google.com')
      end
    end
  end
end
