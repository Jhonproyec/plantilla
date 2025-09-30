export interface OrderInterface{
    idOrder?: number | null;
    orderDate: Date;
    fullName: string;
    idMunicipality: number;
    municipality?: string | null;
    orderDetails: any;
    orderType: 'WHATSAPP' | 'META';
    paymentType: 'SOLO_ENTREGA' | 'RECIBE_PAGO';
    paymentAmount: number,
    orderStatus: 0 | 1;
    phone: string;
    createdAt?: Date | null;
    updatedAt?: Date | null;
    createdBy?: number | null;
    idDepartament?: number | null;
    departament?: string | null;
    address?: string | null;
    idCompany?: number | null;
    nit: string | null;
    phoneTwo: string;
    printerTicket: boolean;
}
