require 'csv'
class MobilesController < ApplicationController
  include ExtraFromProducts
  
  def index
    @mobile = Mobile.all
  end

  def edit
    @mobile = Mobile.find(params[:id])
  end
  def update
    @mobile = Mobile.find(params[:id])
    if @mobile.update(mobile_params)
      redirect_to mobile_path(@mobile)
      flash[:message]="Record updated"
    else
      render :edit
      flash[:message]="Something went wrong. Please have a look"
    end
  end

  def new
    @mobile = Mobile.new
    @mobile.images.build
  end
  def create
    img_attributes = params[:mobile][:image][:photo]
    params[:mobile].delete(:image)
    @mobile= Mobile.new(mobile_params)
    if @mobile.save
      img_attributes.map{ | img | Image.create(photo: img, mobile: @mobile)}
      redirect_to  mobile_path(@mobile)
      flash[:message]="Record saved successfully"
    else
      render :new
      flash[:message]="Something went wrong. Please have a look"
    end
  end
  def specifications
     @mobile = Mobile.find(params[:id])
  end

  def show
    @mobile = Mobile.find(params[:id])
  end
  def destroy
    @mobile = Mobile.find(params[:id])
    @mobile.destroy
    redirect_to mobiles_path
  end
  
  private
  def mobile_params
    params.require(:mobile).permit! #(:company, :product, :specs, :price)
  end
end







