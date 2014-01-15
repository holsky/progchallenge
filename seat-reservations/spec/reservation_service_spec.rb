require "./lib/reservation_service"

describe ReservationService do
  let(:service) { ReservationService.new }
  

  before do
    service.reset
  end

  describe "#reserve" do
    subject { service.reserve(2) }

    it "should reserve the first seats in an empty carriage" do    
      subject.should == [1,2]
    end

    context "first seat is already reserved" do
      before do
        service.reserve(1)
      end

      it "should reserve consecutive seats" do 
        subject.should == [2,3]
      end  
    end
  end

  describe "#list_reserved" do
    subject { service.list_reserved }
    it "should return an empty list with no reservations" do
      subject.should == []
    end

    context "there are reserved seats" do
      before do
        service.reserve(1)
        service.reserve(3)
      end

      it "should list the reservations" do
        subject.should == [1,2,3,4]
      end
    end
  end
end
