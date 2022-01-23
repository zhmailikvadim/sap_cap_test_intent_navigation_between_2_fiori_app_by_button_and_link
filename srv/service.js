module.exports = srv => {
    const { Models, Components, Adapters } = srv.entities

    srv.before('DELETE', '*', async (req) => {
        console.log("DeleteBefore", req.entity, req.params);
        await DELETE.from(getParentInfo(req).entity).where({ 'ID_parent_ID': req.params[req.params.length - 1].ID })
    })

    srv.on('CreateChildEntity', async (req, ) => {
        const parentInfo = getParentInfo(req);
                                                                                                                                                                                                                              parentInfo.ID = req.params[req.params.length - 1].ID;
        parentInfo.IsActiveEntity = req.params[req.params.length - 1].IsActiveEntity;

        if (!parentInfo.IsActiveEntity)
            throw req.reject(400, `Sorry, I couldn't create model, becouse you have parent's draft. Please, save it.`)
        await INSERT.into(parentInfo.entity).columns(['ID_parent_ID', 'name', 'description']).values([parentInfo.ID, 'New Entry', parentInfo.ID]);
    })

    function getParentInfo(req) {
        return (req.entity === 'CatalogService.Kinds') ? { entity: Models } :
            (req.entity === 'CatalogService.Models') ? { entity: Components } :
                (req.entity === 'CatalogService.Components') ? { entity: Adapters } : null;
    }
}