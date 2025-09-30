import { prisma } from "@/config/database";
import { logger } from "@/config/logger";
import { OrderInterface } from "@/interface/orderInterface";
import { NotFoundError } from "@/utils/appError";
import { ticketsService } from "./tickets.service";

class OrderService {
    async saveOrder(order: OrderInterface): Promise<any> {
        try {
            const newOrder = await prisma.order.create({
                data: {
                    createdBy: order.createdBy!,
                    fullName: order.fullName,
                    orderDate: order.orderDate,
                    orderDetails: order.orderDetails,
                    orderStatus: order.orderStatus,
                    orderType: order.orderType,
                    paymentAmount: order.paymentAmount,
                    paymentType: order.paymentType,
                    phone: order.phone,
                    idMunicipality: order.idMunicipality,
                    address: order.address!,
                    idCompany: order.idCompany!,
                    nit: order.nit ?? null,
                    phoneTwo: order.phoneTwo,
                    printerTicker: order.printerTicket
                },
                select: {
                    createdAt: true,
                    createdBy: true,
                    fullName: true,
                    idMunicipality: true,
                    idOrder: true,
                    orderDate: true,
                    orderDetails: true,
                    orderStatus: true,
                    orderType: true,
                    paymentAmount: true,
                    paymentType: true,
                    phone: true,
                    updatedAt: true,
                    address: true,
                    phoneTwo: true, 
                    nit: true,
                    company: {
                        select: {
                            idCompany: true,
                            nameCompany: true,
                        }
                    },
                    municipality: {
                        select: {
                            name: true,
                            idMunicipality: true,
                            departament: {
                                select: {
                                    idDepartament: true,
                                    name: true
                                }
                            }
                        }
                    }

                },
            });
            return newOrder;
        } catch (error) {
            logger.error("Error al crear la orden", error);
            throw error;
        }
    }

    async updateOrder(order: OrderInterface, idOrder: number): Promise<any> {
        try {
            const updateOrder = await prisma.order.update({
                where: { idOrder: idOrder },
                data: {
                    createdBy: order.createdBy!,
                    fullName: order.fullName,
                    orderDate: order.orderDate,
                    orderDetails: order.orderDetails,
                    orderStatus: order.orderStatus,
                    orderType: order.orderType,
                    paymentAmount: order.paymentAmount,
                    paymentType: order.paymentType,
                    phone: order.phone,
                    idMunicipality: order.idMunicipality,
                    address: order.address!,
                    idCompany: order.idCompany!,
                    nit: order.nit,
                    phoneTwo: order.phoneTwo
                },
                select: {
                    createdAt: true,
                    createdBy: true,
                    fullName: true,
                    idMunicipality: true,
                    idOrder: true,
                    orderDate: true,
                    orderDetails: true,
                    orderStatus: true,
                    orderType: true,
                    paymentAmount: true,
                    paymentType: true,
                    phone: true,
                    updatedAt: true,
                    address: true,
                    nit: true, 
                    phoneTwo: true,
                    company: {
                        select: {
                            idCompany: true,
                            nameCompany: true,
                        }
                    },
                    municipality: {
                        select: {
                            name: true,
                            idMunicipality: true,
                            departament: {
                                select: {
                                    idDepartament: true,
                                    name: true
                                }
                            }
                        }
                    }

                },
            });
            return updateOrder;
        } catch (error) {
            logger.error("Error al editar la orden", error);
            throw error;
        }
    }

    async orderById(idOrder: number): Promise<any> {
        try {
            const order = await prisma.order.findUnique({
                where: { idOrder: idOrder },
                select: {
                    createdAt: true,
                    createdBy: true,
                    fullName: true,
                    idMunicipality: true,
                    idOrder: true,
                    orderDate: true,
                    orderDetails: true,
                    orderStatus: true,
                    orderType: true,
                    paymentAmount: true,
                    paymentType: true,
                    phone: true,
                    updatedAt: true,
                    address: true,
                    company: {
                        select: {
                            idCompany: true,
                            nameCompany: true,
                        }
                    },
                    municipality: {
                        select: {
                            name: true,
                            idMunicipality: true,
                            departament: {
                                select: {
                                    idDepartament: true,
                                    name: true
                                }
                            }
                        }
                    }

                },
            });
            return order;
        } catch (error) {
            logger.error("Error al obtener la ordern");
            throw error;
        }
    }

    async deleteOrder(idOrder: number): Promise<void> {
        try {
            const user = await prisma.order.findUnique({
                where: { idOrder: idOrder }
            });
            if (!user) {
                logger.error("No se encontró orden para eliminar");
                throw new NotFoundError("No se encontró orden para eliminar");
            }

            await prisma.order.delete({
                where: { idOrder: idOrder }
            });
            logger.info("Orden eliminada correctamente");
        } catch (error) {
            logger.error("Error al erliminar la orden");
            throw error;
        }
    }

    async getAllOrder(
        page: number = 1,
        limit: number = 10,
        orderStatus: number,
        searchTerm?: string
    ): Promise<{
        orders: any,
        total: number,
        page: number,
        totalPages: number
    }> {
        try {
            const skip = (page - 1) * limit;

            // Construir las condiciones de búsqueda
            const whereCondition: any = {
                orderStatus: orderStatus
            };

            // Si hay término de búsqueda, agregar condiciones OR
            if (searchTerm && searchTerm.trim()) {
                const searchTermLower = searchTerm.trim().toLowerCase();

                whereCondition.OR = [
                    // Búsqueda por nombre completo
                    {
                        fullName: {
                            contains: searchTermLower,
                            // mode: 'insensitive'
                        }
                    },
                ];
            }

            const [orders, total] = await Promise.all([
                prisma.order.findMany({
                    skip,
                    take: limit,
                    where: whereCondition,
                    select: {
                        createdAt: true,
                        createdBy: true,
                        fullName: true,
                        idMunicipality: true,
                        idOrder: true,
                        orderDate: true,
                        orderDetails: true,
                        orderStatus: true,
                        orderType: true,
                        paymentAmount: true,
                        paymentType: true,
                        phone: true,
                        updatedAt: true,
                        address: true,
                        nit: true, 
                        phoneTwo: true, 
                        printerTicker: true,
                        company: {
                            select: {
                                idCompany: true,
                                nameCompany: true,
                            }
                        },
                        municipality: {
                            select: {
                                name: true,
                                idMunicipality: true,
                                departament: {
                                    select: {
                                        idDepartament: true,
                                        name: true
                                    }
                                }
                            }
                        }
                    },
                    orderBy: orderStatus == 1 ? { updatedAt: 'desc' } : { idOrder: 'desc' },
                }),
                prisma.order.count({
                    where: whereCondition
                }),
            ]);

            const totalPages = Math.ceil(total / limit);
            return { orders, total, page, totalPages };
        } catch (error) {
            logger.error("Error al obtener las ordenes", error);
            throw error;
        }
    }

    async markSend(idOrder: number): Promise<any> {
        try {
            await prisma.order.update({
                where: { idOrder: idOrder },
                data: { orderStatus: 1 }
            });
            logger.info("Orden enviada");
        } catch (error) {
            logger.error("Error al cambiar el estado de la orden");
            throw error;
        }
    }


    async generateTicket(idOrder: number): Promise<any> {
        try {
            const data = await prisma.order.findUnique({
                where: { idOrder: idOrder },
                select: {
                    createdAt: true,
                    createdBy: true,
                    fullName: true,
                    idMunicipality: true,
                    idOrder: true,
                    orderDate: true,
                    orderDetails: true,
                    orderStatus: true,
                    orderType: true,
                    paymentAmount: true,
                    paymentType: true,
                    phone: true,
                    updatedAt: true,
                    address: true,
                    phoneTwo: true, 
                    nit: true, 
                    printerTicker: true,
                    company: {
                        select: {
                            idCompany: true,
                            nameCompany: true,
                        }
                    },
                    municipality: {
                        select: {
                            name: true,
                            idMunicipality: true,
                            departament: {
                                select: {
                                    idDepartament: true,
                                    name: true
                                }
                            }
                        }
                    }

                },
            });
            if (data?.company?.idCompany == 1) {
                const response = await ticketsService.generateTicketHolySport(data);
                return response.toString('base64');
            } else {
                const response = await ticketsService.generateTicketGuateBox(data);
                return response.toString('base64');
            }
        } catch (error) {
            logger.error("Error al generar el ticket", error);
            throw (error);
        }
    }
}

export const orderService = new OrderService();