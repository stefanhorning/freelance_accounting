# -*- encoding: utf-8 -*-

require 'spec_helper'

describe ApplicationHelper do

  let(:host) { FactoryGirl.create(:host, id: "ab123") }
  let(:sort_column) { "my_column" }
  let(:sort_direction) { "asc" }

  it "should create link for column sorting" do
    self.stub!(:url_for).and_return '/foo'
    sortable("my_column").should eq "<a href=\"/foo\" class=\"current asc\">My Column</a>"
  end

  it "should create link for column sorting with custom title" do
    self.stub!(:url_for).and_return '/foo'
    sortable("my_column", "My custom title").should eq "<a href=\"/foo\" class=\"current asc\">My custom title</a>"
  end

  it "should create a referrer hiding link" do
    link = referrerless_link_to("My title", "http://mylink.com")
    link.should eq "<a href=\"http://nullrefer.com/?http://mylink.com\">➜ My title</a>"
  end

  it "should create a standard edit button" do
    edit_button(host).should eq "<a href=\"/hosts/ab123/edit\" class=\"btn \"><span class=\"translation_missing\" title=\"translation missing: en.helpers.links.edit\">Edit</span></a>"
  end

  it "should create small edit button" do
    edit_button(host, 'btn-mini').should eq "<a href=\"/hosts/ab123/edit\" class=\"btn btn-mini\"><span class=\"translation_missing\" title=\"translation missing: en.helpers.links.edit\">Edit</span></a>"
  end

  it "should create a standard delete button" do
    delete_button(host).should eq "<a href=\"/hosts/ab123\" class=\"btn  btn-danger\" data-confirm=\"Are you sure you want to delete?\" data-method=\"delete\" rel=\"nofollow\">Delete</a>"
  end

  it "should create a small delete button" do
    delete_button(host, 'btn-mini').should eq "<a href=\"/hosts/ab123\" class=\"btn btn-mini btn-danger\" data-confirm=\"Are you sure you want to delete?\" data-method=\"delete\" rel=\"nofollow\">Delete</a>"
  end

end
