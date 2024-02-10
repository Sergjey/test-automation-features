require 'httparty'

RSpec.describe 'JSONPlaceholder API' do
  # Задаем базовый URL для API
  base_url = 'https://jsonplaceholder.typicode.com'

  # Тест кейсы для API endpoints
  describe 'Posts endpoint' do
    it 'should return a list of posts' do
      response = HTTParty.get("#{base_url}/posts")
      expect(response.code).to eq(200)
      expect(response.headers['content-type']).to match(/application\/json/)
    end

    it 'should return a specific post' do
      response = HTTParty.get("#{base_url}/posts/1")
      expect(response.code).to eq(200)
      expect(response.headers['content-type']).to match(/application\/json/)
      expect(response['id']).to eq(1)
    end
  end

  describe 'Comments endpoint' do
    it 'should return a list of comments for a specific post' do
      response = HTTParty.get("#{base_url}/posts/1/comments")
      expect(response.code).to eq(200)
      expect(response.headers['content-type']).to match(/application\/json/)
    end
  end

  describe 'Users endpoint' do
    it 'should return a list of users' do
      response = HTTParty.get("#{base_url}/users")
      expect(response.code).to eq(200)
      expect(response.headers['content-type']).to match(/application\/json/)
    end

    it 'should return a specific user' do
      response = HTTParty.get("#{base_url}/users/1")
      expect(response.code).to eq(200)
      expect(response.headers['content-type']).to match(/application\/json/)
      expect(response['id']).to eq(1)
    end
  end

  describe 'Invalid endpoint' do
    it 'should return a 404 error' do
      response = HTTParty.get("#{base_url}/invalid")
      expect(response.code).to eq(404)
    end
  end
end
