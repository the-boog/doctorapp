class AppointmentsController < ApplicationController
  before_action :set_doctor
  def index
    @appointments = @doctor.appointments
  end

  def new
    @appointment = @doctor.appointments.new
    @patients_all = Patient.all
    render "form"
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def show
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :patient_id)
  end
end

