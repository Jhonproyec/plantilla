import { prisma } from "@/config/database";

class DashboardService {
    async getDashboardData() {
        const hoy = new Date();
        const anioActual = hoy.getFullYear();
        const inicioMesActual = new Date(anioActual, hoy.getMonth(), 1);
        const inicioMesAnterior = new Date(anioActual, hoy.getMonth() - 1, 1);
        const finMesAnterior = new Date(anioActual, hoy.getMonth(), 0);

        // ===================== KPIs =====================
        const ventasMesActual = await prisma.order.aggregate({
            _sum: { paymentAmount: true },
            where: { orderStatus: 1, orderDate: { gte: inicioMesActual } }
        });

        const ventasMesAnterior = await prisma.order.aggregate({
            _sum: { paymentAmount: true },
            where: {
                orderStatus: 1,
                orderDate: { gte: inicioMesAnterior, lte: finMesAnterior },
            },
        });

        const ventasTotales = ventasMesActual._sum.paymentAmount ?? 0;
        const ventasTotalesAnterior = ventasMesAnterior._sum.paymentAmount ?? 0;

        const pedidosPendientes = await prisma.order.count({ where: { orderStatus: 0 } });
        const pedidosPendientesAnterior = await prisma.order.count({
            where: { orderStatus: 0, orderDate: { gte: inicioMesAnterior, lte: finMesAnterior } },
        });

        const pedidosCompletadosHoly = await prisma.order.count({ where: { orderStatus: 1, idCompany: 1 } });
        const pedidosCompletadosAnteriorHoly = await prisma.order.count({
            where: { orderStatus: 1, orderDate: { gte: inicioMesAnterior, lte: finMesAnterior }, idCompany: 1 },
        });

        const pedidosCompletadosBag = await prisma.order.count({ where: { orderStatus: 1, idCompany: 2 } });
        const pedidosCompletadosAnteriorBag = await prisma.order.count({
            where: { orderStatus: 1, orderDate: { gte: inicioMesAnterior, lte: finMesAnterior }, idCompany: 2 },
        });

// LOS ÍCONOS ENVIADOS SON DE ANGULAR MATERIAL
        const kpis = [
            {
                title: "Pagos recibidos",
                value: `$${ventasTotales.toLocaleString()}`,
                change: calcularCambio(ventasTotales, ventasTotalesAnterior),
                changeType: ventasTotales >= ventasTotalesAnterior ? "positive" : "negative",
                icon: "trending_up",
                color: "#9FE7F5",
            },
            {
                title: "Pedidos Pendientes",
                value: pedidosPendientes,
                change: calcularCambio(pedidosPendientes, pedidosPendientesAnterior),
                changeType: pedidosPendientes <= pedidosPendientesAnterior ? "positive" : "negative",
                icon: "pending_actions",
                color: "#419EBD",
            },
            {
                title: "Pedidos Completados HolySports",
                value: pedidosCompletadosHoly,
                change: calcularCambio(pedidosCompletadosHoly, pedidosCompletadosAnteriorHoly),
                changeType: pedidosCompletadosHoly >= pedidosCompletadosAnteriorHoly ? "positive" : "negative",
                icon: "sports_baseball",
                color: "#063F5C",
            },
            {
                title: "Pedidos Completados Guate Bag Print",
                value: pedidosCompletadosBag,
                change: calcularCambio(pedidosCompletadosBag, pedidosCompletadosAnteriorBag),
                changeType: pedidosCompletadosBag >= pedidosCompletadosAnteriorBag ? "positive" : "negative",
                icon: "card_travel",
                color: "#F27F0C",
            },
        ];

        // ===================== CHARTS =====================

        const ventasRaw = await prisma.order.findMany({
            where: {
                orderStatus: 1,
                orderDate: { gte: new Date(anioActual, 0, 1), lt: new Date(anioActual + 1, 0, 1) }
            },
            select: { orderDate: true, paymentAmount: true }
        });

        const ventasPorMes = Array(12).fill(0);
        ventasRaw.forEach(v => {
            const mes = v.orderDate.getMonth();
            ventasPorMes[mes] += v.paymentAmount ?? 0;
        });

        const lineChartLabels = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
        const lineChartData = ventasPorMes;

        // 2️⃣ Pedidos por tipo (pie)
        const pedidosPorTipo = await prisma.order.groupBy({
            by: ["orderType"],
            _count: { idOrder: true },
        });

        const pieChartLabels = pedidosPorTipo.map(p => p.orderType);
        const pieChartData = pedidosPorTipo.map(p => p._count.idOrder);
        const pedidosSemanaRaw = await prisma.order.findMany({
            where: {
                orderDate: { gte: new Date(anioActual, 0, 1) }
            },
            select: { orderDate: true, orderStatus: true }
        });

        // Arrays separados: pendientes y completados
        const pendientes = new Array(7).fill(0);
        const completados = new Array(7).fill(0);

        pedidosSemanaRaw.forEach(p => {
            const dia = p.orderDate.getDay(); 
            if (p.orderStatus === 0) {
                pendientes[dia] += 1;
            } else if (p.orderStatus === 1) {
                completados[dia] += 1;
            }
        });

        const barChartLabels = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];

        const barChartData = [
            {
                label: "Pendientes",
                data: pendientes,
                backgroundColor: "#063F5C",
                borderRadius: 4
            },
            {
                label: "Completados",
                data: completados,
                backgroundColor: "#F7AD1A",
                borderRadius: 4
            }
        ];

        return {
            kpis,
            charts: {
                line: { labels: lineChartLabels, data: lineChartData },
                pie: { labels: pieChartLabels, data: pieChartData },
                bar: { labels: barChartLabels, data: barChartData },
            }
        };
    }
}

const calcularCambio = (actual: number, anterior: number) => {
    if (anterior === 0) return '+100%';
    const diff = ((actual - anterior) / anterior) * 100;
    const sign = diff >= 0 ? '+' : '';
    return `${sign}${diff.toFixed(2)}%`;
}

export const dashboardService = new DashboardService();
