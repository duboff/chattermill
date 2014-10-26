describe Project do

  before(:each) { @project = Project.new(name: 'Cool Project', body: 'Bla bla bla') }

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:body) }

  it { should belong_to(:company) }
  it { should have_many(:texts) }
  it { should have_many(:themes) }


  it { should validate_presence_of :name }

  it "#name returns a string" do
    expect(@project.name).to match 'Cool Project'
  end

  it "#body returns the right string" do
    expect(@project.body).to match 'Bla bla bla'
  end

  context "Creating texts" do
    it 'text creation is triggered on project creation', :vcr do
      expect(Text).to receive(:create)

      Project.create(name: "A cool project", body: 'Bla Baa')
    end

    it 'breaks body down and creates texts on project creation' do
      allow_any_instance_of(Text).to receive(:process_text).and_return true
      new_project = Project.create(name: "Another cool project", body: fake_text)

      expect(new_project.texts.count).to eq 24
      expect(new_project.texts.first.body).to eq "Bad experience. Very rude and inefficient customer service from staff and management. Rooms were not cleaned very well and they woke you up all hours of the night to turn down your bed. Very overpriced for a very bad experience. rooms were dated with furniture that was chipped and needed maintenance. management does not back up their name, service or efficiencies or lack there of. rude staff and management, unconsistent policies. if you are middle class then they want nothing to do with you. don't waste your money."
    end
  end
end

def fake_text
  "Bad experience. Very rude and inefficient customer service from staff and management. Rooms were not cleaned very well and they woke you up all hours of the night to turn down your bed. Very overpriced for a very bad experience. rooms were dated with furniture that was chipped and needed maintenance. management does not back up their name, service or efficiencies or lack there of. rude staff and management, unconsistent policies. if you are middle class then they want nothing to do with you. don't waste your money.
  I there went 1 week in the month of August. The hotel really was packed world. I paid a little more of $900/nuit but it is acceptable (without the breakfast). For this price I imagined myself a big luxury and I is not was disappointed! The hotel very well welcomed me, the rooms were splendid, the excellent food! The hotel relaxed me, I also played blackjack, to roulette and to the poker, it was really a stay of dreams!! If you want pass a good week of luxury. Pass it in this hotel if you have a good condition of life! Anyway $900/nuit this is not given for all the world! (I am French and I am not extremely strong to write in English to grieve if you do not understand me!!)
  It was a really nice hotel considering it is Las Vegas (which has very little class to begin with and a great effort is necessary in order to give it some). I really enjoyed the fact that the pool only allows hotel guests which helped maintain a good level of tranquility. Being in my mid-20s with a reasonable standard of decorum, I would suggest this hotel and casino to anyone who wants to go to Vegas and stay some where with a little class.
  The Bellagio is an absolute haven amongst the madness of Las Vegas. The staff are friendly, the hotel is elegant with excellent facilities and the rooms very comfortable. We ate in three of the hotel restaurants and the food and service were superb. If you must go to Las Vegas, definitely stay here if you want to stay reasonably sane throughout your visit!
  My stay at the Bellagio was such a wonderful experience. The staff was very courtous. My dining experience was beyond believe. I not only look for a good meal, but presentation is very important to me, and the Bellagio had them all. I have been going to Las Vegas for the past 25 years, and I must say the Bellagio filled my every expectation. I will be back next year, and will stay at the Bellagio. Your pool was great I truly enjoyed it.
  The staff was rude, incompetent, and extremely unprofessional, and the sheets were stained. My husband ordered champagne and strawberries to be waiting in our room when we checked in as a surprise. After 20 minutes he called down to see what the hold up was and 35 minutes after that they finally arrived. The next morning we found out after calling ahead to the valet for our car, you guessed it, they lost it. Over an hour later with us standing in the garage and talking to 3 different attendants our car arrived. We missed the appointment to go over our wedding photos. We complained to the management and they were going to give us dinner. It showed up on our bill. We then had trouble with the front desk getting the charges off the bill. I went down to the front desk to check out and their front desk staff was rude to me and then talked about me to another customer within earshot. I will never stay here again. If you are looking for 5 star service
  first class hotel and sevrive
  We went for our honeymoon. We had the best time ever!
  We stayed at the Bellagio to celebrate my 30th birthday and it was great. The staff was always helpful, and very nice. the front desk was attentive and very pleasant. They came to our room twice a day once for cleaning, and a second for turn down service. They upgraded our room for a discounted price and we had a beautiful view of the strip and lake, where we could see all of the fountain shows from our own window. The placement of the hotel on the strip is also very convenient as it is very close to the forum stores at Ceasars, and it is right across the street from the Paris hotel where there is some great eateries. The Bellagio also has some wonderful restaurants such as Noodles which is fairly priced for Vegas. Overall my stay at the Bellagio was far and above the expectations I had, and would go back in a heartbeat.
  My husband and I recently stayed here and we'd definitely stay again. From the time we checked in until the time we checked out, the staff was courteous, and rooms were clean. We didnt use the pools but we had a great view of them from our window and there had to be 10 of them and they never seemed to be crowded. My only complaint would be the ventilation system in the casino, the casino area wreaked of cigarette smoke. I'm sure smoke is a problem in all the other casinos but if they could fix this aspect of the hotel, it would have been a perfect stay.
  We stayed at the Bellagio but we visited all the major hotels. The Bellagio was nice but over priced. Will not stay there again.
  Over priced and overated hotel. Had to tip 3 people just to get my bags to the room. Great room but all resturants are very expensive within hotel complex. Mini bar fridge rules are ridiculous./ Great location
  I dont know what the big deal is about the Bellagio...food never came hot...always felt like I was being rushed...taps leaked in bathroom...handles off of the dresser drawers...front staff was great... very helpful...its the perfect location but other than that I would never stay there again
  The Bellagio is simply fantastic. You feel like it's the place to be. The spacious rooms, the pools, the restaurants, the service, and the security were outstanding.
  The hotel was beautiful. Front desk staff was very friendly as well as housekeeping. My room was spacious and very clean. The only complaint I have is that the restaurants were very overpriced. The pool restaurant especially. It cost $60.00 for my daughter and I to have breakfast. I ordered Eggs Benedict and the yolk was hard and cold. Service was very slow. For $60.00 I want the best breakfast I ever had and that was not the case. The Bellagio was top notch but all of the restaurants were overpriced and nothing to write home about.
  beautiful hotel and a great experience.
  My wife and I stayed at the B for 3 nights and it was an awesome experience. We would definitely stay again if we didn't have a plan to experience other hotels. Highly recommended! Our room got upgraded by this very nice young lady at the front desk due to a mistake made by the online travel website. We appreciate it.
  A long queue at the front desk on arrival, but staff very accomodating when asked for adjoining rooms which were not prebooked. Great rooms but would have liked coffee and tea making facilities on hand. Would love to return to Las Vegas and would go back to The Bellagio. Thank you!
  This was our first trip to Las Vegas in 30 years. The Bellagio helped make it a very special anniversary celebration for us. It lived up to its wonderful reputation in every way. We enjoyed the accommodations, entertainment, food and shopping. The service from the time we checked in to the time we checked out was outstanding - the registration people, the concierge, the wait staff and the shop clerks. We are not buffet people at all, but the buffet at the Bellagio changed that. Our only regret is that we did not go to the buffet until our last day. Two suggestions for improvements - a small refrigerator in the room and more comfortable guest chairs in the room. We would definitely recommend the Bellagio to our friends and we would definitely stay there again.
  excellent worth the experience centrally located service second to none and a feel good experience would highly recommend
  Wow what a great place. Just got back Apr 12/09. Everyone seemed so friendly to us. The view from the rooms was amazing. I would tell anyone to go and stay at the Bellagio. All the staff was very friendly and polite. Way to go 110%. can't wait to go back in Oct. Thanks for the Awesome time Bellagio :):):)
  Very ellegant, extremely plush, worth every penny.
  This was the greatest holiday for us and our friends that travelled with us. We went to several shows, gambled, walked the strip, and checked out other hotels, and of course shopped. We could not have asked for anything better (Except for having more money so we could have not more than what we did) However, we had great company, and a great time. Thank you!
  pity no coffee making in rooms"
end