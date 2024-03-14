# frozen_string_literal: true

namespace :load do
  task :creation, [:create_count] => [:environment] do |_task, args|
    puts "Start creation of #{args[:create_count]} post(s)."

    posts = FactoryBot.create_list(:post, args[:create_count].to_i)
    posts << Post.create(title: 'Fox', body: 'Body')

    posts.each {|post| p [post.id, post.title, post.body] }

    puts 'Created successfully.'
  end

  task persistence: :environment do
    puts 'Start update.'

    Post.each do |post|
      post.update!(
        title: Faker::Book.title,
        body: Faker::Quote.famous_last_words
      )
    end

    Post.each { |post| p [post.id, post.title, post.body] }

    puts 'Updated successfully.'
  end

  task deletion: :environment do
    puts 'Start deletion.'

    Post.destroy_all

    puts 'Deleted successfully.'
  end

  task match_all_search: :environment do
    puts 'Start ES match_all search.'

    post_ids = Post.search(query: { match_all: {} }).results.pluck('_id')

    Post.where(id: { '$in': post_ids })
        .each { |post| p [post.id, post.title, post.body] }

    puts 'ES Search is successful.'
  end

  task :keyword_search, [:query] => [:environment] do |_task, args|
    puts 'Start ES keyword search.'

    post_ids = Post.search(args[:query])
                   .results
                   .pluck('_id')

    Post.where(id: { '$in': post_ids })
        .each { |post| p [post.id, post.title, post.body] }

    puts 'ES Search is successful.'
  end
end
