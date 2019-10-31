json.extract! student, :id, :gradYear, :graduating_class_id, :firstName, :lastName, :studentID, :balance, :paidBalance, :created_at, :updated_at
json.url student_url(student, format: :json)
