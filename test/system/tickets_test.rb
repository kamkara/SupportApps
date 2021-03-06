require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Amount", with: @ticket.amount
    fill_in "Author", with: @ticket.author
    fill_in "Contact", with: @ticket.contact
    fill_in "Content", with: @ticket.content
    fill_in "Custom name", with: @ticket.custom_name
    fill_in "Id facturier", with: @ticket.id_facturier
    fill_in "Id transaction", with: @ticket.id_transaction
    fill_in "Operation", with: @ticket.operation
    fill_in "Service", with: @ticket.service
    fill_in "Slug", with: @ticket.slug
    fill_in "Title", with: @ticket.title
    fill_in "User", with: @ticket.user_id
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @ticket.amount
    fill_in "Author", with: @ticket.author
    fill_in "Contact", with: @ticket.contact
    fill_in "Content", with: @ticket.content
    fill_in "Custom name", with: @ticket.custom_name
    fill_in "Id facturier", with: @ticket.id_facturier
    fill_in "Id transaction", with: @ticket.id_transaction
    fill_in "Operation", with: @ticket.operation
    fill_in "Service", with: @ticket.service
    fill_in "Slug", with: @ticket.slug
    fill_in "Title", with: @ticket.title
    fill_in "User", with: @ticket.user_id
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
