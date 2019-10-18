class PagesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def delete
  end

  def destroy
  end

  def dues_params
  end

  def import
    duesTable.import(params[:file])
    redirect_to pages_index_path, notice: "File Uploaded Successfully"
  end
end
