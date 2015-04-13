FactoryGirl.define do
  factory :occupation do
    company { Forgery('name').company_name }
    company_url { Forgery('internet').domain_name }
    company_description { Forgery('lorem_ipsum').paragraph }
    title { Forgery('name').job_title }
    start_date { Forgery('date').date }
    end_date { |o| o.start_date + (1 + rand(777)).days }
    details do
      (3 + rand(6)).times.map do
        Forgery('lorem_ipsum').sentence
      end
    end

    factory :current_occupation do
      end_date nil
    end
  end
end
