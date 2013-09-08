require 'spec_helper'

describe ResearchAttempt do
  let(:research_attempt) { ResearchAttempt.new(date: Date.parse('2013-06-10')) }

  it "should return the date" do
    expect(research_attempt.date).to eq(Date.parse('2013-06-10'))
  end
end
