class NutsController < ApplicationController
  # GET /nuts
  # GET /nuts.json
  def index
    if params.has_key? "query" and not params[:query].blank?
      query = "%" + params[:query] + "%"
      @nuts = Nut.where("title LIKE ?", query).order("rating DESC")
      @q = params[:query]
    else
      @nuts = Nut.order("rating DESC").all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nuts, include: :user, except: [:user_id, :password_hash, :password_salt]  }
    end
  end

  # GET /nuts/1
  # GET /nuts/1.json
  def show
    @nut = Nut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nut, include: :user, except: [:user_id, :password_hash, :password_salt] }
    end
  end

  # GET /nuts/new
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /nuts/1/edit
  def edit
    @nut = Nut.find(params[:id])
  end

  # POST /nuts
  # POST /nuts.json
  def create
    @nut = Nut.new(params[:nut])
    @nut.rating = 0
    @nut.user = current_user

    respond_to do |format|
      if @nut.save
        format.html { redirect_to @nut, notice: 'Nut was successfully created.' }
        format.json { render json: @nut, status: :created, location: @nut }
      else
        format.html { render action: "new" }
        format.json { render json: @nut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nuts/1
  # PUT /nuts/1.json
  def update
    @nut = Nut.find(params[:id])

    respond_to do |format|
      if @nut.update_attributes(params[:nut])
        format.html { redirect_to @nut, notice: 'Nut was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @nut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuts/1
  # DELETE /nuts/1.json
  def destroy
    @nut = Nut.find(params[:id])
    @nut.destroy

    respond_to do |format|
      format.html { redirect_to nuts_url }
      format.json { head :ok }
    end
  end

  def up
    @nut = Nut.find(params[:id])
    @nut.rating += 1
    @nut.save

    respond_to do |format|
      format.html
      format.json { render :json => @nut.rating }
    end
  end

  def down
    @nut = Nut.find(params[:id])
    @nut.rating -= 1
    @nut.save

    respond_to do |format|
      format.json { render :json => @nut.rating }
    end
  end
end
