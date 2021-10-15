require_relative 'required_files'

describe Book do
  before :each do
    @book = Book.new('Harry Potter', 'J.K. Rowling')
  end

  describe '#instance' do
    it 'should return an instance of Book' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'should return title' do
      expect(@book.title).to eq 'Harry Potter'
    end
  end

  describe '#author' do
    it 'should return author' do
      expect(@book.author).to eq 'J.K. Rowling'
    end
  end

  describe '#rentals' do
    it 'should respond to rentals' do
      expect(@book).to respond_to(:rentals)
    end
  end
end
