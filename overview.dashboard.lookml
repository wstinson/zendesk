- dashboard: overview
  title: Overview
  layout: grid
  rows:
    - elements: [new_open_tickets, pending_tickets, closed_tickets]
      height: 150
    - elements: [tickets_by_channel]
      height: 300
    - elements: [top_orgs, top_requesters, top_assignees]
      height: 300

#  filters:

  elements:

  - name: new_open_tickets
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    filters:
      tickets.status: new,open
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: New and open tickets
    show_comparison: false
  - name: pending_tickets
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: tickets
    dimensions: [tickets.status]
    measures: [tickets.count]
    filters:
      tickets.status: pending
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Pending tickets
    show_comparison: false
  - name: closed_tickets
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    filters:
      tickets.status: closed,solved
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Closed and solved tickets
    show_comparison: false
  - name: tickets_by_channel
    title: Untitled Visualization
    type: looker_pie
    model: zendesk
    explore: tickets
    dimensions: [tickets.via__channel]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    value_labels: legend
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_view_names: true
  - name: top_orgs
    title: Top 20 organizations by tickets submitted
    type: table
    model: zendesk
    explore: tickets
    dimensions: [tickets.organization_name]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
  - name: top_requesters
    title: Top 20 requesters by tickets submitted
    type: table
    model: zendesk
    explore: tickets
    dimensions: [tickets.requester_email]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
  - name: top_assignees
    title: Top 20 agents by all time tickets
    type: table
    model: zendesk
    explore: tickets
    dimensions: [tickets.assignee_email]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false





