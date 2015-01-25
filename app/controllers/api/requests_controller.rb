module Api
  class RequestsController < ::ApplicationController
    def execuate
      begin
        password = Rails.application.secrets.sql_secret_key
        connection = ActiveRecord::Base.connection
        db_result = connection.execute(params[:sql])
        result = db_result.to_json
      rescue Exception => e
        result = {status: 500, error_message: result}
      end
      render result
    end
  end
end