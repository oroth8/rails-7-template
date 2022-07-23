# frozen_string_literal: true

class UnitsController < ApplicationController
  before_action :set_unit, only: %i[show edit update destroy]

  # GET /units or /units.json
  def index
    @units = policy_scope(Unit)
  end

  # GET /units/1 or /units/1.json
  def show; end

  # GET /units/new
  def new
    @unit = Unit.new
    authorize @unit
    @orgs = Organisation.all.pluck(:id)
  end

  # GET /units/1/edit
  def edit
    @orgs = Organisation.all.pluck(:id)
  end

  # POST /units or /units.json
  def create
    respond_to do |format|
      if @unit.save
        format.html { redirect_to unit_url(@unit), notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1 or /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to unit_url(@unit), notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1 or /units/1.json
  def destroy
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unit
    @unit = policy_scope(Unit).find(params[:id])
    authorize @unit
  end

  # Only allow a list of trusted parameters through.
  def unit_params
    params.require(:unit).permit(:name, :number, :organisation_id)
  end
end
