class RequestsController < ApplicationController
  def index
    @harfile = Harfile.find params['harfile_id']
    @requests = @harfile.requests
    render json: { requests: @requests }
  end

  def show
    @harfile = Harfile.find params['harfile_id']
    @requests = @harfile.requests
    @request = @requests[params['id'].to_i]
    render json: { request: @request }
  end
end
